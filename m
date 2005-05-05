Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j45CYAO15329
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 08:34:10 -0400
Received: from mail.uni-bamberg.de (urz52.uni-bamberg.de [141.13.240.52])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j45CY7d1023989
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 08:34:08 -0400
From: Martin Eisenhardt <martin.eisenhardt@wiai.uni-bamberg.de>
Subject: Re: [linux-lvm] help
Date: Thu, 5 May 2005 14:33:53 +0200
References: <427A1103.7030207@ucd.ie>
In-Reply-To: <427A1103.7030207@ucd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200505051433.53748.martin.eisenhardt@wiai.uni-bamberg.de>
Reply-To: martin.eisenhardt@wiai.uni-bamberg.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

Hello Colm,

On Thursday 05 May 2005 14:26, Colm G. Connolly wrote:
> I've just got a new 250G hard drive and have been trying to add it to an
> [...]
>    482  mount
>    483  df -h
>
> At this point I got a bit concerned that I had added 250G to the logical
> volume but pvdisplay only reported a capicity of 232.88G even though hdd
> is a 250G hard drive. So I started to try to remove the

I know that this is *not* your main concern but I think it worth noting that 
the size of your 250G harddisk was correctly reported as being 232.88G. The 
reason being that harddisk vendors use 1G = 1000^3 while computer science 
defines 1G = 1024^3. (Note: I think there are some standard definition by the 
IEEE(?) but I don't have a URL for that.)

So 250*1000^3 = 250.000.000.000 ~ 232.8*1024^3

Wish you all the luck for the problems remaining!

Kind regards
Martin Eisenhardt

-- 
Dipl.Wirtsch.Inf.(Univ.) Martin Eisenhardt

Bamberg University
Media Informatics
D - 96045 Bamberg

fon: +49 (951) 863 - 2856
fax: +49 (951) 863 - 2852
