Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o8KDghne022785
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 20 Sep 2010 09:42:49 -0400
Date: Mon, 20 Sep 2010 09:42:42 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20100920134241.GA27548@redhat.com>
References: <chaz20100920111622.GA3547@yahoo.fr>
	<F57F2AD357626644AF76410876025D75529E4F@CGYEX705.encana.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F57F2AD357626644AF76410876025D75529E4F@CGYEX705.encana.com>
Subject: Re: [linux-lvm] restoring snapshots
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 20 2010 at  9:15am -0400,
Kinzel, David <David.Kinzel@encana.com> wrote:

> >Is there any plan to add the feature to efficiently
> >restore/apply/commit a snapshot (that is only dump the cow data
> >onto the original volume without writing the whole volume) or
> >does that feature exist already and I missed it?
> 
> The newer versions do have the lvmerge feature, and it seems to work in
> RHEL6 beta from what I could see.

Yes, and the changes are also upstream, see:
https://www.redhat.com/archives/linux-lvm/2010-February/msg00029.html
https://www.redhat.com/archives/linux-lvm/2010-May/msg00017.html

Mike
