Return-Path: <lars.bensmann@epost.de>
Date: Sun, 14 Jan 2001 07:54:35 +0100
From: Lars Bensmann <lars.bensmann@epost.de>
Subject: Re: [linux-lvm] Help: ERROR -154
Message-ID: <20010114075435.A7184@epost.de>
References: <3A5DBB0000001DCB@mail.epost.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A5DBB0000001DCB@mail.epost.de>; from lars.bensmann@epost.de on Sat, Jan 13, 2001 at 09:41:32PM +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello,

On Sat, Jan 13, 2001 at 09:41:32PM +0100, lars.bensmann@epost.de wrote:
> when running vgscan I get the following error message:
> 
> vgscan -- ERROR -154: can't get data of volume group "part" from physical
> volume(s)
> vgscan -- ERROR -154 creating "/etc/lvmtab" and "/etc/lvmtab.d"

sorry for posting to the list and then finding the answer in the archives.

I tried to run vgcfgrestore before posting to the list, but I didn't know
that "/etc/lvmtab" does not exist was not a feature, but a bug. After
touching it and mkdir'ing /etc/lvmtab.d/ it worked OK, although it gave an
error on the first run about not being able to insert the VG into
/etc/lvmtab. But that went away on the second run.

Thanks for LVM which worked perfectly for me (until now :-),
Lars

-- 
I consume, therefore I am
