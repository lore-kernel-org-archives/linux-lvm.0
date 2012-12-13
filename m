Message-ID: <50CA0492.1050906@redhat.com>
Date: Thu, 13 Dec 2012 16:38:42 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
References: <CAG2kNCw6r7KKOZonGagjCbw9QiftDQOAv5Qn-m8aNnLQUf4sNQ@mail.gmail.com>
	<CAG2kNCy_qwLar7Cw3rr=7j7LP=XRvFMRv7Jit3SHWy+O_SmuRA@mail.gmail.com>
	<50C9F6AF.50908@redhat.com>
	<CAG2kNCwH-VKPVGyafcid8eSbg8uNZtNhqVs=GtGqKs21f6BHYA@mail.gmail.com>
In-Reply-To: <CAG2kNCwH-VKPVGyafcid8eSbg8uNZtNhqVs=GtGqKs21f6BHYA@mail.gmail.com>
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
To: Gianluca Cecchi <gianluca.cecchi@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 13/12/12 16:11, Gianluca Cecchi wrote:
> I found in another thread that the resulting LV with pvmove remains a
> striped one on only one disk as far as its structure is concerned...
> with degraded performance...
> Have you an example of pvmove command options to test to execute based
> on my test?
> So that I can verify with my loop devices?

Yes, you're right. You will end up with both stripes still present but
on a single disk.

The best I could do using pvmove was to move individual extents around
(!) to make the LV contiguous on-disk. Of course, this doesn't remove
the striping and inflates the number of segments since each pair of
striped extents effectively becomes a segment.

The lvconvert command also still accepts a -i <n> parameter but doesn't
do anything useful with it and doesn't report an error.

Regards,
Bryn.
