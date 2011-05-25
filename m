Received: from localhost (dhcp-100-19-150.bos.redhat.com [10.16.19.150])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p4PDN24A028308
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 25 May 2011 09:23:03 -0400
Date: Wed, 25 May 2011 09:23:02 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110525132301.GD10145@redhat.com>
References: <1306228823.2195.9.camel@franck-VPCCW2S1E>
	<1306230666.2195.10.camel@franck-VPCCW2S1E>
	<20110524131451.GB27519@redhat.com>
	<1306311098.3911.5.camel@franck-VPCCW2S1E>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1306311098.3911.5.camel@franck-VPCCW2S1E>
Subject: Re: [linux-lvm] Trim support on stripped volumes ?
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 25 2011 at  4:11am -0400,
Franck Routier (personnel) <alci@mecadu.org> wrote:

> Le mardi 24 mai 2011 � 09:14 -0400, Mike Snitzer a �crit :
> 
> > When using -o discard, ext4 will log a warning if a discard failed (and
> > will disable discards).
> > 
> > So ext4 is a great indicator for whether discards are working on your
> > striped LV volume.
> > 
> 
> Just out of curiosity, how does ext4 tell if discards is working or
> not ?

It checks the return code from ext4_issue_discard() -- which comes from
sb_issue_discard().  See: fs/ext4/mballoc.c:release_blocks_on_commit()
