Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0ACwtr00701
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 07:58:55 -0500
Received: from web52707.mail.yahoo.com (web52707.mail.yahoo.com
	[206.190.39.158])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id j0ACwsap005168
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 07:58:54 -0500
Message-ID: <20050110125840.55588.qmail@web52707.mail.yahoo.com>
Date: Mon, 10 Jan 2005 04:58:40 -0800 (PST)
From: Patrick Bartkus <patrckb22@yahoo.com>
Subject: Re: [linux-lvm] she-bang doesn't work - bad interpreter: Permission
	denied
In-Reply-To: <20050109202833.GT1816@zippy.toger.us>
MIME-Version: 1.0
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

Jason,

[Very embarrassed sheepish grin]

Well, as a matter of fact, it was...

Thanks! That fixed everything.
Patrick

--- Jason Martin <jhmartin@toger.us> wrote:

> On Sun, Jan 09, 2005 at 11:12:57AM -0800, Patrick
> Bartkus wrote:
> > When I try to excute a simple perl program on my
> > /home/.../bin (which is on a logical volume
> partition)
> > I get:
> Make sure that /home isn't mounted noexec.
> 
> -Jason Martin
> -- 
> Confucius say: Man who run behind truck get
> exhausted.
> This message is PGP/MIME signed.



		
__________________________________ 
Do you Yahoo!? 
Meet the all-new My Yahoo! - Try it today! 
http://my.yahoo.com 
 
