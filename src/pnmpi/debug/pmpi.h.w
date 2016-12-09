/* This file is part of P^nMPI.
 *
 * Copyright (c)
 *  2008-2016 Lawrence Livermore National Laboratories, United States of America
 *  2011-2016 ZIH, Technische Universitaet Dresden, Federal Republic of Germany
 *  2013-2016 RWTH Aachen University, Federal Republic of Germany
 *
 *
 * P^nMPI is free software; you can redistribute it and/or modify it under the
 * terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation version 2.1 dated February 1999.
 *
 * P^nMPI is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
 * A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with P^nMPI; if not, write to the
 *
 *   Free Software Foundation, Inc.
 *   51 Franklin St, Fifth Floor
 *   Boston, MA 02110, USA
 *
 *
 * Written by Martin Schulz, schulzm@llnl.gov.
 *
 * LLNL-CODE-402774
 */

/* Macros in this header replace the PMPI function calls with tiny wrappers to
 * call the PMPI function and checking the return code. If MPI_SUCCESS is not
 * found, pmpi_error will be called. */


#ifndef PNMPI_PRIVATE_PMPI_H
#define PNMPI_PRIVATE_PMPI_H


#include <mpi.h>

#include <pnmpi/debug_io.h>


{{forallfn fn_name}}
#define P{{fn_name}}({{args}})                 \
  {                                            \
    if (P{{fn_name}}({{args}}) != MPI_SUCCESS) \
      pnmpi_error("P{{fn_name}} failed.\n");   \
  }
{{endforallfn}}


#endif