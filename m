Return-Path: <jamesp@foobarhouse.com>
Date: Thu, 26 Jul 2001 13:13:45 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Subject: Re: [linux-lvm] lvm on root
In-Reply-To: <20010726133632.A26425@tiger.bigcats.invalid>
Message-ID: <Pine.LNX.4.33.0107261310130.1896-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 26 Jul 2001, Wolfgang Weisselberg wrote:

That's more sensible - the only reason I built my LVM to look like that
was to confuse my colleagues into thinking my laptop was running HP-UX as
well as Informix :) The standard HP-UX install creates LVM names like
mine.

James

> James Pattinson (jamesp@foobarhouse.com) wrote 42 lines:
>
> > [root@greebo /root]# bdf
> > Filesystem           1k-blocks      Used Available Use% Mounted on
> > /dev/vg00/lvol1         262132     92988    169144  36% /
> > /dev/vg00/lvol2        3145628   2382316    763312  76% /usr
> > /dev/vg00/lvol3         262132    103400    158732  40% /var
> [...]
>
> Personally, I name my LVs to match their (usual) mountpoints,
> because I do not want to remember the number/mountpoint
> matching, so I have LV names like
>
