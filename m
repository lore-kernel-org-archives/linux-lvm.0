From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] badiane: problem with LVM
Message-ID: <20011023205857.A4280@dardhal.mired.net>
References: <64662.64.34.222.41.1003857491.squirrel@webmail.tekmd.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <64662.64.34.222.41.1003857491.squirrel@webmail.tekmd.com>
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
Date: Tue Oct 23 13:54:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Tuesday, 23 October 2001, at 13:18:11 -0400,
gdurand@tekmd.com wrote:

> I have compiled kernel 2.4.12 with LVM enabled on Debian.  Upon reboot and
> having created a partition hda5 with cfdisk, I ran pvcreate on /dev/hda5 and
> received
> malloc error in vg_check_active.c [line 76]
> pvcreate -- invalid i/o protocol version
> 
> Can someone offer any help?
> 
It seems a mismatch between LVM tools and kernel code versions. That is,
vanilla 2.4.12 includes 0.9.1-beta7(ish) as far as I remember, but at
least Potato includes an ancient version of lvm-tools. The protocol used
by the tools to comunicate with the kernel part has changed several times,
and it seems that it is the problem you are having.

I would download the latest LVM tarball from sistina.com, patch the 
kernel and compile the tools as said on the documentation included. This
way, the mismatch won't happen again, and you'll get LVM code you can rely
on (there were some problems with LVM in the past).

-- 
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian Linux Woody (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk
