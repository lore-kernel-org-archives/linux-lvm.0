From: <jrelist@ntlworld.com>
Subject: Re: Re: [linux-lvm] Installing LVM on s/390 redhat 7.2 2.4.7-39
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20030130182221.OSRD22267.mta01-svc.ntlworld.com@[10.137.100.61]>
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
Date: Thu Jan 30 12:23:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Well, it's working ! I removed the lvm 1.0.3-10 rpm, and compiled the 1.0.6 tools, then set up libraries and manually placed files in a similar way to a note I saw from Bill Blunn in Feb 02, and I've now got a functioning VG and Lvols with ext3 ! It's all started to go right with that little patch for alloc_sz etc.

Just to be on the safeside, I've been taking full backups of the 3390s from the os/390 side before I made major changes !

Thanks for your help Peter and Patrick. 
