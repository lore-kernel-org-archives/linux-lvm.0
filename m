Message-ID: <51F8FEB7.9050004@redhat.com>
Date: Wed, 31 Jul 2013 14:10:31 +0200
From: Peter Rajnoha <prajnoha@redhat.com>
MIME-Version: 1.0
References: <1375197482-4824-1-git-send-email-christian@iwakd.de>
	<51F8CFDD.5060605@redhat.com>
	<573874159e2a0196c68f44d6b5dc334a@iwakd.de>
In-Reply-To: <573874159e2a0196c68f44d6b5dc334a@iwakd.de>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] lvremove: perform retry logic also on -real
 subvolume for snapshots
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
To: Christian Seiler <christian@iwakd.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 07/31/2013 01:31 PM, Christian Seiler wrote:
>> But still it would be better to look why those spurious events
>> are triggered for non-top-level volumes (it's possible the
>> OPTIONS:="nowatch" in some case, I'll check...).
> 
> I can try to see if I can reproduce it later this week with udevd
> running with --debug to see what is going on.
> 

OK, thanks.

One more question - what's the distro you're using? Some distros
change udev rules or they add completely different ones from upstream
(for example I know that Debian changes upstream LVM udev rules).

Or have you tested this with upstream (or Fedora) LVM version?

Peter
