Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1CJdE130856
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 14:39:14 -0500
Received: from smtp810.mail.ukl.yahoo.com (smtp810.mail.ukl.yahoo.com
	[217.12.12.200])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k1CJdBot013934
	for <linux-lvm@redhat.com>; Sun, 12 Feb 2006 14:39:11 -0500
Date: Sun, 12 Feb 2006 18:00:42 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060212180042.GA30694@tui.site>
References: <20060206215141.GB7492@tui.site> <20060208093304.GA9374@tui.site>
	<43EA91F9.4040700@struzak.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43EA91F9.4040700@struzak.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Feb 08, 2006, Marcin Struzak wrote:
> Gunther Clasen wrote:
> >[...] Or is my harddisk dying? 
> 
> Take a look at smartmontools (http://smartmontools.sourceforge.net/); 
> they can accurately pinpoint existing or imminent hard-disk failures.

Well, that is the reason for my wish to extend that VG. So that I can
copy data from my failing disk:

Feb 12 16:12:55 tui smartd[5958]: Device: /dev/hde, 4 Currently unreadable (pending) sectors
Feb 12 16:12:55 tui smartd[5958]: Device: /dev/hde, 1 Offline uncorrectable sectors

/dev/hda and /dev/hdg only report changes in attributes 8 and 209
(Seek_Time_Performance and Offline_Seek_Performnce). I don't thik that
is a problem.

I'm still quite puzzled as to why I can't crate physical volumes on
/dev/hdg9 and /dev/hdg10, when /dev/hdg7 and /dev/hdg8 work fine...
It can't possibly be down to the filters, as the program suggested?

Regards,

Gunther
