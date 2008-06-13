Received: from pobox.nrt.redhat.com (pobox.nrt.redhat.com [10.64.255.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5D2Vdve003165
	for <linux-lvm@redhat.com>; Thu, 12 Jun 2008 22:31:40 -0400
Received: from localhost (dhcp-193-199.nrt.redhat.com [10.64.193.199])
	by pobox.nrt.redhat.com (8.13.1/8.13.1) with ESMTP id m5D2Vdko011437
	for <linux-lvm@redhat.com>; Fri, 13 Jun 2008 11:31:39 +0900
Date: Fri, 13 Jun 2008 11:31:39 +0900 (JST)
Message-Id: <20080613.113139.17746189.yamato@redhat.com>
From: Masatake YAMATO <yamato@redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] multiple openlog invocations in clvmd.c
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,
	syslog_init static variable defined in debuglog() of 
daemons/clvmd/clvmd.c is not used properly: the variable is
never updated.

Here is a fix.

Masatake YAMATO

Index: daemons/clvmd/clvmd.c
===================================================================
RCS file: /cvs/lvm2/LVM2/daemons/clvmd/clvmd.c,v
retrieving revision 1.47
diff -c -r1.47 clvmd.c
*** daemons/clvmd/clvmd.c	5 Jun 2008 14:24:28 -0000	1.47
--- daemons/clvmd/clvmd.c	12 Jun 2008 14:07:55 -0000
***************
*** 182,189 ****
  		va_end(ap);
  	}
  	if (debug == DEBUG_SYSLOG) {
! 		if (!syslog_init)
  			openlog("clvmd", LOG_PID, LOG_DAEMON);
  
  		va_start(ap,fmt);
  		vsyslog(LOG_DEBUG, fmt, ap);
--- 182,191 ----
  		va_end(ap);
  	}
  	if (debug == DEBUG_SYSLOG) {
! 		if (!syslog_init) {
  			openlog("clvmd", LOG_PID, LOG_DAEMON);
+ 			syslog_init = 1;
+ 		}
  
  		va_start(ap,fmt);
  		vsyslog(LOG_DEBUG, fmt, ap);
