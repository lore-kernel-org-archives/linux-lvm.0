Message-Id: <20011230005214.88869.qmail@web13005.mail.yahoo.com>
From: Prashant Kharche <pdkharche@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] installation of LVM
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
Date: Sat Dec 29 18:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-LVM@sistina.com

Hi !
Im trying to install LVM 1.0.1-rc4 on Red Hat linux
7.1. First step given in the install file is to run
"configure" script. But when i run "./configure", it
says "No such file or directory exists.." im not
getting whats the problem..

So please give me the detailed installation
procedure..

Also, im trying to use LVM loadable module of kernel
2.4.2. When i do 
make config (select the LVM module)
make dep
make clean
make modules
make modules_install
make bzImage
lilo
and load the compiled kernel it gives me following
errors
like
delaying eth0 initialization..
vfat not supported by this kernel
sound driver fails

How should i remove these errors??



__________________________________________________
Do You Yahoo!?
Send your FREE holiday greetings online!
http://greetings.yahoo.com
