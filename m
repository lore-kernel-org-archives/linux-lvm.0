Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7THx1V09002
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 13:59:01 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7THwxRP001886
	for <linux-lvm@redhat.com>; Mon, 29 Aug 2005 13:59:00 -0400
Date: Mon, 29 Aug 2005 19:58:59 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050829175858.GC23960@percy.comedia.it>
References: <20050828101721.GB26065@gutek>
	<1125227257.2225.63.camel@pc7.dolda2000.com>
	<1125229353l.13661l.6l@tangerine>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1125229353l.13661l.6l@tangerine>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

On Sun, Aug 28, 2005 at 11:42:33AM +0000, Jean-Luc Coulon (f5ibh) wrote:
>Le 28.08.2005 13:07:37, Fredrik Tolf a �crit�:
>>On Sun, 2005-08-28 at 12:17 +0200, Chris Osicki wrote:
>> > Hi
>> >
>> > I seam not to be able to convince vgscan to let my cdroms alone.
>> > In the file /etc/lvm/lvm.conf I have this filter:
>> >
>> > [ "r|/dev/cdrom.*" ]
>>
>>Try it without the dot:
>>[ "r|/dev/cdrom*" ]
>   [ "r|/dev/cdrom*|"] maybe ?
>
>You can even be more restrictive/explicit:
>filter = [ "r|/dev/cdrom*|", "r|/dev/cdrw*|", "r|/dev/dvd*|",  
>"r|/dev/hd[ab]|" ]
>

i don't have the code at hand, but, if they are regular expression
"/dev/cdrom*" would match
/dev/cdrom
/dev/cdromm
/dev/cdrommm
/dev/cdrommmm
and so on..

see man 7 regex

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
