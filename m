Return-Path: <sherlock_ind@yahoo.com>
Message-ID: <20010124104400.67358.qmail@web12008.mail.yahoo.com>
Date: Wed, 24 Jan 2001 02:44:00 -0800 (PST)
From: sherlock holmes <sherlock_ind@yahoo.com>
Subject: Re:[linux-lvm] Basic Questions on LVM
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="0-416813019-980333040=:64360"
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
To: linux-lvm@sistina.com

--0-416813019-980333040=:64360
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

hi,
I had sent these questions with no response till
date...can anyone let me know if there is an answer to
it?
Note: forwarded message attached.


__________________________________________________
Do You Yahoo!?
Yahoo! Auctions - Buy the things you want at great prices. 
http://auctions.yahoo.com/
--0-416813019-980333040=:64360
Content-Type: message/rfc822

X-Apparently-To: sherlock_ind@yahoo.com via web12004.mail.yahoo.com
X-Track: 1: 40
Received: from hermes.sistina.com  (HELO sistina.com) (208.210.145.141)
  by mta418.mail.yahoo.com with SMTP; 16 Jan 2001 04:04:55 -0800 (PST)
Received: (qmail 13145 invoked from network); 16 Jan 2001 12:03:04 -0000
Received: from localhost (HELO hermes.sistina.com) (127.0.0.1)
  by localhost with SMTP; 16 Jan 2001 12:03:04 -0000
Return-Path: <sherlock_ind@yahoo.com>
Delivered-To: linux-lvm@sistina.com
Received: (qmail 13086 invoked from network); 16 Jan 2001 12:02:06 -0000
Received: from web12007.mail.yahoo.com (216.136.172.215)
  by hermes.sistina.com with SMTP; 16 Jan 2001 12:02:06 -0000
Message-ID: <20010116120243.4935.qmail@web12007.mail.yahoo.com>
Received: from [208.222.150.143] by web12007.mail.yahoo.com; Tue, 16 Jan 2001 04:02:43 PST
From: sherlock holmes <sherlock_ind@yahoo.com>
To: linux-lvm@sistina.com
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [linux-lvm] Basic Questions on LVM
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
X-BeenThere: linux-lvm@sistina.com
X-Mailman-Version: 2.0
Precedence: bulk
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Id: linux-lvm general discussion <linux-lvm.sistina.com>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue, 16 Jan 2001 04:02:43 -0800 (PST)
Content-Length: 1076

Hi,
I am 1 month old to LVM and have some basic doubts in
LVM code.

1.During initialisation y is it LVM is registered both
as a block and char device where as according to me it
is supposed to be a block device driver and when one
does the pvcreate,vgcreate..etc it calls the ioctls of
the char device of LVM.

2.what is exactly the control flow when and read/write
request is given to a file residing on the LVM
partition...(ie where and how exactly the mapping
tables exist..?)

3.what is the importance of VGDA and vgscan?

4.during boot up time what are checks/modification
made by the kernel with respect to the LVM/logical
volumes?

5.moreover to what extent is KIOBUF supported on linux
2.4. Can someone give me the workaround to check for
KIOBUF working..

thanks,
Sherlock.


__________________________________________________
Do You Yahoo!?
Get email at your own domain with Yahoo! Mail. 
http://personal.mail.yahoo.com/
_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
--0-416813019-980333040=:64360--
