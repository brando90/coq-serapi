(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(************************************************************************)
(* Coq serialization API/Plugin                                         *)
(* Copyright 2016 MINES ParisTech                                       *)
(************************************************************************)
(* Status: Very Experimental                                            *)
(************************************************************************)

(******************************************************************************)
(* Global Protocol Options                                                    *)
(******************************************************************************)

type ser_opts = {
  (* Input output Options *)
  in_chan  : in_channel;        (* Input/Output channels                                *)
  out_chan : out_channel;
                                (* Printers                                   *)
  printer  : Sertop_ser.ser_printer;

  debug    : bool;
  print0   : bool;
  lheader  : bool;              (* Print lenght header (deprecated)           *)

  (* Coq options *)
  coq_path : string;            (* Coq standard library location *)
  std_impl : bool;              (* Whether the standard library should be loaded with implicit paths *)
                                (* -R and -Q options                          *)
  loadpath : Sertop_init.load_path_spec list;
  async    : Sertop_init.async_flags;
}

(******************************************************************************)
(* Input/Output -- Main Loop                                                  *)
(******************************************************************************)

(** [ser_loop opts] main se(xp)r-protocol loop *)
val ser_loop : ser_opts -> unit
