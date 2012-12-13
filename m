Message-ID: <50C9F6AF.50908@redhat.com>
Date: Thu, 13 Dec 2012 15:39:27 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
	<CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
In-Reply-To: <CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Convert striped lv to single pv on another disk?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Gianluca Cecchi <gianluca.cecchi@gmail.com>

On 13/12/12 15:28, Gianluca Cecchi wrote:
> Searching on Internet I found several methods and the one I tested (at
> the moment only on loop devices) and seems ok is this one below, that
> passes through creating a mirror between the initial striped lv
> components and the new pv with lvconvert command and then gets rid off
> the initial pvs

Why not just use pvmove to move the extents off the two original PVs and
onto the third? The end result is the same (and internally it's not
dissimilar - pmove creates a temporary mirror volume to do its work) but
it's less manual work and should be more robust as pvmove does
checkpointing that allows the process to be interrupted and restarted.

Regards,
Bryn.
