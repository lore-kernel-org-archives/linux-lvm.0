Message-ID: <20011114172014.28685.qmail@web14402.mail.yahoo.com>
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] using lvmsar
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
Date: Wed Nov 14 11:18:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I wanted to know few things about lvmsar.

1. It gives Total Reads and Writes. Is this
   number in blocks ? I mean No of blocks read
   and written.

2. The time it prints, what time is that. Is it the
   time when lvmsar read the info from the given 
   file or the time when the info was written into
   the file by lvmsadc. The reason I am asking this
   is there is a "ctime" call in lvmsar.

3. How efficient will it be to use lvmsar instead of
   sar to do some sort statistics. For example if I
   want to get some data like I/O....B/s over a device
   or volume.....should I use lvmsar....
      or rather I will rephrase this question, Can I
   get somethig like the I/O statistic  rate using
   lvmsar, and the time I get from it, or should I use
  my own time when I called lvmsadc and compare the  
  difference with it ?

regards,
Aman Shahi.

__________________________________________________
Do You Yahoo!?
Find the one for you at Yahoo! Personals
http://personals.yahoo.com
