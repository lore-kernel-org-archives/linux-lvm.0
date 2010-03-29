Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TK6HGU003751
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 16:06:17 -0400
Received: from EXHUB016-2.exch016.msoutlookonline.net
	(exhub016-2.exch016.msoutlookonline.net [207.5.72.164])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2TK63WY014250
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 16:06:03 -0400
Message-ID: <4BB10828.8020702@cfl.rr.com>
Date: Mon, 29 Mar 2010 16:06:00 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BB0EEFC.5090207@cfl.rr.com> <20100329190531.GA15304@us.ibm.com>
In-Reply-To: <20100329190531.GA15304@us.ibm.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] dmeventd mirror monitoring
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 3/29/2010 3:05 PM, malahal@us.ibm.com wrote:
> Currently it has snapshot and mirror (raid1) plugins. The mirror part
> does monitor (event based) for failed legs or logs and takes some
> actions. At the moment, all of its configuration is in /etc/lvm/lvm.conf
> file. Look at activation section.
> 
> 1) It doesn't notify the admin.
> 2) It doesn't automatically rebuild with a given sparse disk. Although
>    you can use "allocate" to get this kind of feature. I have not
>    tested this feature though!

Ahh there it is, all described in the conf file comments.  Just wasn't
described in the man page for it.  Thanks.
