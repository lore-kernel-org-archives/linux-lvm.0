Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1KFuci08059
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 10:56:38 -0500
Received: from web80007.mail.yahoo.com (web80007.mail.yahoo.com [66.163.168.137])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1KFucb30387
	for <linux-lvm@redhat.com>; Fri, 20 Feb 2004 10:56:38 -0500
Message-ID: <20040220155635.46931.qmail@web80007.mail.yahoo.com>
From: <cmc2slack-lvm@yahoo.com>
Subject: Re: [linux-lvm] finding the right size for rootvg
In-Reply-To: <20040220152636.GC25086@redhat.com>
MIME-Version: 1.0
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
Date: Fri Feb 20 10:55:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Heinz writes:

> It'll 'limit' you to a maximum LV size of 512GB if that is an issue
> in LVM1.
> Once you migrate to LVM2 there's no such constraint any more.

Thanks Heinz, that's not a problem since this is a 
home system, only has 8GB and 60GB HD's. Will the
small extent make a difference in performance?

=====
Chris Conn
cmc2goat@swbell.net
http://storm.cadcam.iupui.edu/~cmcgoat
Austin, TX, USA
