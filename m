Return-Path: <terjekv@ifi.uio.no>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 10 Apr 2001 01:43:31 +0200
Message-ID: <wxxhezxskpo.fsf@fjorir.ifi.uio.no>
MIME-Version: 1.0
Subject: [linux-lvm] perl modules dealing with LVM, and a small request.
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

  hi. :)

  I'm currently writing a set of perl modules to interact with LVM.
  the basic difference from what has been done earlier is that these
  modules are purely a library. they're not at all dedicated to a GUI
  or any such thing. the hope is that these modules might some day be
  useful in several different contexts, all sharing the same modules
  and the same codebase. the code will be (is) GPL, but it's currently
  not really able to do anything, except read data from /proc and
  extend LV's. 

  the structure so far is rather simple, this example code shows the
  use of the main module, which is all the caller ever sees.

,----[ sample usage of LVM.pm ]
| use LVM;
| 
| print "Module version: $LVM::VERSION\n";
| 
| my $lvm = new LVM; # defaults to reading /proc/lvm/globals
| 
| print <<"EOT";
| version: $lvm->{'version'} from $lvm->{'date'} (IOP $lvm->{'iop'})
| 
| size: $lvm->{'size'}
| active: $lvm->{'time'}
| 
| VGs: $lvm->{'vgcount'}. PVs: $lvm->{'pvcount'}.
| LVs: $lvm->{'lvcount'}. (open LVs: $lvm->{'lvopencount'})
| 
| EOT
| 
| for my $vg (@{$lvm->{'vglist'}}) { # each scalar in the vglist is a LVM::VG object.
|     printf "  \"$vg->{'name'}\": %s total space, %s free.\n",
|            $vg->{'totalkb'},
|            $vg->{'freekb'};
|     
|     print "\n  LVs:\n";
|
|     for my $lv (@{$vg->{'lvlist'}}) { # each scalar in the lvlist is LVM::LV object
|         printf "   %10s: %s (%d)\n", $lv->{'name'}, $lv->{'totalkb'},$lv->{'totalpe'};
| 
|         if ($lv->{'name'} eq 'logs') { # let's resize the 'logs' LV
|             $lv->resize(24, 'pe');     # to 24 PE's. kb / mb etc are also valid units
|         }
| 
|     }
|     $vg->store(); # not implicit store of changes, must be called explicitly
| }
`----

  (I'm guessing people will find it rather straightforward what this
  does and what its output is...)

  $vg->store() (or even $lvm->store()) propagates the store()-call to
  all objects, you could also call $lv->store() manually, if you'd
  like. only objects that are changed from their original settings are
  altered.

  there are no real reasons for not calling store() implicitly, it's
  just that I (at least currently :) like to test the modules before
  saying "ok". besides, you can always say: "$lv->resize(25, 'pe');
  $lv->store();" which will make the change happen there and then.

  anyhow, for the request. I'd like a few /proc/lvm/globals to see
  what it looks like with a lot of different VG's and such. I
  currently have limited possibilities in making major changes to my
  LVM-structure. :/

  if people want to see the early stuff, I'll make it available upon
  request. 

-- 
Terje
