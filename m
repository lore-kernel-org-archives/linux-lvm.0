From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] filesystem does not reflect new LV size
Message-ID: <20020607011548.GB29695@tiger.bigcats.invalid>
References: <200206061638.g56GcYr19414@bach.leonora.org> <20020606165925.GA8756@fib011235813.fsnet.co.uk> <20020606120917.B31838@connectlive.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020606120917.B31838@connectlive.com>
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
Date: Thu Jun  6 20:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Tim!

Tim (tim@connectlive.com) wrote 57 lines:

> Hey, out of curiosity, are there folks out there who have mounted an
> ext3 filesystem as ext2, resized it, rebuilt the journal, and had good
> success with the process?

Why would you *mount* a filesystem and resize it, when it's
safer and easier done unmounted?

Simply umount, resize2fs (use e2fsadm as a wrapper, if you are
LVMming), mount it and off you go.  To ext2, .journal is but
another file, AFAIK, and if you umounted cleanly, nothing will
have to be played back, AFAIK.

Works well enough for me, when I use it.

-Wolfgang
