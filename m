Message-Id: <20020302025015.61413.qmail@web13404.mail.yahoo.com>
From: Bhasker C V <bhaslinux@yahoo.com>
In-Reply-To: <20020301150033.D22608@lynx.adilger.int>
MIME-Version: 1.0
Subject: [linux-lvm] Kernel 2.5.5 - slightly OT
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
Date: Fri Mar  1 20:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: sagundu@npd.hcltech.com, smothila@hcltech.com, kkasinat@npd.hcltech.com, madsrini@npd.hcltech.com

Hi all

 Anyone sucessful in compiling lvm (linux) ( not as a module but inside
kernel itself) for linux  kernel 2.5.5 - 

 whenever i add the option of raid and lvm, the make bzImage exits with
error at lvm.c and rd.c. I omitted these modules and compiled kernel
and kernel is ok - now i need to access lvm partitions. 

 any work arounds to load older lvm kernel modules into current kernel
- tried even a forced insmod - no use ! - says some unresolved externals.

=====
Bye
Bhasker C V

The box said "Requires Windows 95, NT, or better", so I installed Linux.

__________________________________________________
Do You Yahoo!?
Yahoo! Sports - sign up for Fantasy Baseball
http://sports.yahoo.com
