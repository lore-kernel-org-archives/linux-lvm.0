From: Tom Brown <thecap@mail.utexas.edu>
Subject: Re: [linux-lvm] installation of LVM
Message-Id: <20011229234703.K8366@cream.ece.utexas.edu>
References: <20011230005214.88869.qmail@web13005.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011230005214.88869.qmail@web13005.mail.yahoo.com>;
    from pdkharche@yahoo.com on Sat, Dec 29, 2001 at 04:52:14PM -0800
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
Date: Sat Dec 29 23:45:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Dec 29, 2001 at 04:52:14PM -0800, Prashant Kharche wrote:
> Hi !
> Im trying to install LVM 1.0.1-rc4 on Red Hat linux
> 7.1. First step given in the install file is to run
> "configure" script. But when i run "./configure", it
> says "No such file or directory exists.." im not
> getting whats the problem..
Are you sure you are in the correct directory?

I unpacked my source in /usr/src so I needed to change to
/usr/src/LVM/1.0.1 before running ./configure.

(If you use tab completion it is fairly easy to avoid these problems.)

> So please give me the detailed installation
> procedure..

Did you read the README and INSTALL files in LVM/1.0.1? The INSTALL
file has good instructions. Try using one window to read the
instructions and another to do them.

> Also, im trying to use LVM loadable module of kernel
> ....
> and load the compiled kernel it gives me following
> errors
> like
> delaying eth0 initialization..
> vfat not supported by this kernel
> sound driver fails
>
> How should i remove these errors??

Did you patch the kernel is instructed in PATCHES/README (step 3 in
LVM/1.0.1/INSTALL) ? You don't need to but you didn't mention it.
Anyway, your problem seems to be that you didn't add the modules for
vfat and your sound card. The kernel config program does not select
the modules you are currently using. I've made the same mistake. Try
using /var/log/dmesg, /etc/modules and lspci to work out what you need 
to add to your new kernel. There may be a better way to find out what 
you are currently using (like perl -V or apache -V), but I don't know 
it.

-- 
mailto:thecap@usa.net
http://www.ece.utexas.edu/~thecap/
28 70 20 71 2C 65 29 61 9C B1 36 3D D4 69 CE 62 4A 22 8B 0E DC 3E
