Message-ID: <4E7B0DD5.20102@redhat.com>
Date: Thu, 22 Sep 2011 12:28:37 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <1316623554-28975-1-git-send-email-lczerner@redhat.com>
	<1316623554-28975-29-git-send-email-lczerner@redhat.com>
In-Reply-To: <1316623554-28975-29-git-send-email-lczerner@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH 28/35] fsadm: Umount ext2 file system prior
	resize
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: linux-lvm@redhat.com

Dne 21.9.2011 18:45, Lukas Czerner napsal(a):
> ext2 does NOT support online resize, so we should attempt to umount the
> file system first.
> 


Hmm - wondering when this has changed, as in the time it's been developed I
think it has worked - thought it's been some experimental kernel support.
It seems to be even mentioned in many man pages around that ext2 should work
online, but my current 3.0 refuses to do it - so it's probably ok to disable
it for ext2.  (So currently user needs to add  '-e' option to proceed).

Zdenek
