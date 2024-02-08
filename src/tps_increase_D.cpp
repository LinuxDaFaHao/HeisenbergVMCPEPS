//
// Created by haoxinwang on 04/12/2023.
//
#include "./qldouble.h"
#include "qlpeps/algorithm/vmc_update/vmc_peps.h"
#include "spin_onehalf_heisenberg_kagome_model_sqrpeps_solver.h"
#include "./params_parser.h"
#include "myutil.h"

using namespace qlpeps;
using namespace std;


int main(int argc, char **argv) {
  VMCUpdateParams params(argv[1]);
  SplitIndexTPS<TenElemT, U1QN> split_index_tps(params.Ly, params.Lx);
  bool is_load = split_index_tps.Load();
  if (!is_load) {
    std::cout << "Loading TPS files fails." << std::endl;
    exit(-1);
  }
  if (!split_index_tps.IsBondDimensionEven()) {
    std::cout << "warning : D is not even." << std::endl;
  }

  for (size_t row = 0; row < params.Ly; row++) {
    for (size_t col = 0; col < params.Lx; col++) {
      size_t dim = split_index_tps({row, col}).size();
      std::cout << "[ " << row << ", " << col << "] :";
      std::vector<size_t> vb_dims = split_index_tps({row, col})[0].GetShape();
      for (size_t i = 0; i < dim; i++) {
        Tensor local_ten = split_index_tps({row, col})[i];
        double norm = local_ten.Get2Norm();
        std::vector<IndexT> index_vec(4);
        for (size_t a = 0; a < 4; a++) {
          index_vec[a] = IndexT({QNSctT(U1QN(0), vb_dims[a] + 1)},
                                local_ten.GetIndex(a).GetDir()
          );
        }
        Tensor new_ten(index_vec);
        new_ten.Random(qn0);
        new_ten *= (1e-3 * norm);
        for (size_t x = 0; x < vb_dims[0]; x++)
          for (size_t y = 0; y < vb_dims[1]; y++)
            for (size_t z = 0; z < vb_dims[2]; z++)
              for (size_t w = 0; w < vb_dims[3]; w++) {
                TenElemT elem = local_ten({x, y, z, w});
                new_ten({x, y, z, w}) = elem;
              }
        split_index_tps({row, col})[i] = new_ten;
      }
    }
  }
  split_index_tps.Dump();
  return 0;
}