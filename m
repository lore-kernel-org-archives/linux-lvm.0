Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3B03D3B6.71BF4AD8@loria.fr>
Date: Thu, 17 May 2001 15:35:50 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] main drive fail
References: <31470A1D25F5D311940A0020182B88D319F973@mail.n-ary.com>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Thomas Inglis wrote:
> 
> Thomas, Did you restore the lvm related entries in /etc ?
> Well, using
>    vgcfgrestore -nlvmGroup /dev/hdb1         (thx Dominque)
> says that /etc/lvmconf/lvmGroup.conf doesnt exists, backup not available.

You are not supposed to loose these files .... aie ;-(
As I understand, there is a copy of this info. on every phys. volume.
But it seems no utility exist for restoring this info. into
/etc/lvmconf/...

What does pvscan give you ?

And I did not understand if you also want to recover the
data in the volume group lvmGroup ? (it would be simpler if not ...)

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
