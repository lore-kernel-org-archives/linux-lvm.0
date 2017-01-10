From: Eric Ren <zren@suse.com>
Message-ID: <4d90b417-b9cc-12a0-67ef-5b5886d9c456@suse.com>
Date: Tue, 10 Jan 2017 21:02:36 +0800
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] New features for using lvm on shared storage
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Teigland <teigland@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi David,

Sorry for faking this reply because I'm not in the maillist before I noticed
this email (quoted blow) you posted for a while.

I have a questions about "lvmlockd":

Besides clvmd cannot be used together with lvmetad, is there any other
main differences between "lvmetad" and "clvmd"? Do you recommend we replace
"clvmd" with "lvmetad"?

Thanks for your brilliant efforts. I will have a try soon;-)

Eric

"""

For people using LVM (or clvm) on shared storage, I encourage you to take
a look at two recent additions that you may find to be an improvement:

1. System ID

is for static ownership of VGs by hosts:
http://man7.org/linux/man-pages/man7/lvmsystemid.7.html

The nearest equivalent to system ID in the past has been configuring
lvm.conf filters uniquely on each host.

2. lvmlockd

is for dynamically sharing VGs among hosts:
http://man7.org/linux/man-pages/man8/lvmlockd.8.html

Using lvmlockd with dlm is similar to what clvmd has done in the past.
Using lvmlockd with sanlock has no prior equivalent.

(For distribution packaging, see the "lvm2-lockd" rpm.)

Dave
"""
