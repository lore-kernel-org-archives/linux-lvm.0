Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1PJaXi08010
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 14:36:33 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1PJaWb08480
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 14:36:33 -0500
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: upgrade from kernel 2.4 to 2.6
Message-ID: <20040225193630.GC15582@percy.comedia.it>
References: <20040224031633.GA7431@dman13.dyndns.org> <20040224072602.GB23439@percy.comedia.it> <20040224131632.GA20556@dman13.dyndns.org> <20040224222521.GA31185@percy.comedia.it> <20040225014950.GA5519@dman13.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040225014950.GA5519@dman13.dyndns.org>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 25 14:35:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Feb 24, 2004 at 08:49:50PM -0500, Derrick 'dman' Hudson wrote:
>On Tue, Feb 24, 2004 at 11:25:22PM +0100, Luca Berra wrote:
>| look in /etc/lvm/lvm.conf
>| there is a log section, you can make lvm log to a different file, so
>| you can save and post logs from lvm activation commands.
>
>Ok, I found that.
>
>Here is the log file, in its entirety :
>
>----
>toollib.c:298 vgscan  No volume groups found
>----
>
>I did set verbosity=3 because the comments in lvm.conf said that is
>the highest verbosity.
try changing other parameters in the log {} section, eg 'level'

L.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
