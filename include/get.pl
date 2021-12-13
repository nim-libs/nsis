#!/usr/bin/perl
#
# Get the appropriate variables to make an NSIS installer file
# based on the PE architecture of a specific file

use strict;
use bytes;

my $archnames = (
	0x01de => 'am33',
	0x8664 => 'x64',
	0x01c0 => 'arm32',
	0x01c4 => 'thumb',
	0xaa64 => 'arm64',
	0x0ebc => 'efi',
	0x014c => 'x86',
	0x0200 => 'ia64',
	0x9041 => 'm32r',
	0x0266 => 'mips16',
	0x0366 => 'mips',
	0x0466 => 'mips16',
	0x01f0 => 'powerpc',
	0x01f1 => 'powerpc',
	0x0166 => 'mips',
	0x01a2 => 'sh3',
	0x01a3 => 'sh3',
	0x01a6 => 'sh4',
	0x01a8 => 'sh5',
	0x01c2 => 'arm32',
	0x0169 => 'wcemipsv2'
);
