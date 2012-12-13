MIME-Version: 1.0
In-Reply-To: <50C9F6AF.50908@redhat.com>
References: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
	<CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
	<50C9F6AF.50908@redhat.com>
Date: Thu, 13 Dec 2012 17:11:59 +0100
Message-ID: <CAG2kNCwH-VKPVGyafcid8eSbg8uNZtNhqVs=GtGqKs21f6BHYA@mail.gmail.com>
From: Gianluca Cecchi <gianluca.cecchi@gmail.com>
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
Content-Transfer-Encoding: 7bit
To: "Bryn M. Reeves" <bmr@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Dec 13, 2012 at 4:39 PM, Bryn M. Reeves  wrote:
> On 13/12/12 15:28, Gianluca Cecchi wrote:
>> Searching on Internet I found several methods and the one I tested (at
>> the moment only on loop devices) and seems ok is this one below, that
>> passes through creating a mirror between the initial striped lv
>> components and the new pv with lvconvert command and then gets rid off
>> the initial pvs
>
> Why not just use pvmove to move the extents off the two original PVs and
> onto the third? The end result is the same (and internally it's not
> dissimilar - pmove creates a temporary mirror volume to do its work) but
> it's less manual work and should be more robust as pvmove does
> checkpointing that allows the process to be interrupted and restarted.
>
> Regards,
> Bryn.
>
>

I found in another thread that the resulting LV with pvmove remains a
striped one on only one disk as far as its structure is concerned...
with degraded performance...
Have you an example of pvmove command options to test to execute based
on my test?
So that I can verify with my loop devices?
Thanks
Gianluca
