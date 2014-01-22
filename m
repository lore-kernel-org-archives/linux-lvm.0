From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>, <87y52fdiyp.fsf@red.mvo.lan>,
	<52DD0D54.6060704@redhat.com>
In-reply-to: <52DD0D54.6060704@redhat.com>
Date: Wed, 22 Jan 2014 11:02:39 +0200
Message-ID: <8761pc5qz4.fsf@red.mvo.lan>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Identifying useable block devices
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
To: Peter Rajnoha <prajnoha@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Peter Rajnoha <prajnoha@redhat.com> writes:

> However, you're right that in case of thin LVs, this is set incorrectly.
> The DM_UDEV_DISABLE_OTHER_RULES flag should not be there. I've fixed that:
>
> https://git.fedorahosted.org/cgit/lvm2.git/commit/?id=91b26b63b408b7d7b4f79f0754d190783874e4cc

Great!  And just in time for the release, too! :-)
