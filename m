Return-Path: <Dominique.Larchey-Wendling@loria.fr>
Message-ID: <3B03CA91.B93B06A@loria.fr>
Date: Thu, 17 May 2001 14:56:49 +0200
From: Dominique LARCHEY-WENDLING <Dominique.Larchey-Wendling@loria.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] main drive fail
References: <31470A1D25F5D311940A0020182B88D319F972@mail.n-ary.com>
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

> vgcreate lvmGroup /dev/hdb1 /dev/hdc1 /dev/hdd1
> informs me the drive(s) are already part of the lvmGroup

vgcfgrestore /dev/hdb1
vgcfgrestore /dev/hdc1
vgcfgrestore /dev/hdd1

DL

-- 
Dominique Larchey
LORIA, Nancy, France
Tel. (Work) +33 (0) 3 83 59 20 13
