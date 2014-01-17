From: Marius Vollmer <marius.vollmer@redhat.com>
References: <87zjmxzmga.fsf@red.mvo.lan>,<87y52fdiyp.fsf@red.mvo.lan>
In-reply-to: <87y52fdiyp.fsf@red.mvo.lan>
Date: Fri, 17 Jan 2014 15:35:38 +0200
Message-ID: <87vbxieno5.fsf@red.mvo.lan>
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
To: Marius Vollmer <marius.vollmer@redhat.com>
Cc: linux-lvm@redhat.com

Marius Vollmer <marius.vollmer@redhat.com> writes:

> Hmm, DM_UDEV_DISABLE_OTHER_RULES_FLAG is (now) set for thin volumes, as
> far as I can tell.

For what it's worth, the DM_UDEV_DISABLE_OTHER_RULES_FLAG disappears
when cycling the volume to inactive and back to active.
