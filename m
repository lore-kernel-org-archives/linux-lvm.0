From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020509121534.A22956@connectlive.com>
References: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>; from rau@archway.com on Thu, May 09, 2002 at 09:54:40AM -0700
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
Date: Thu May  9 12:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Quoth Au, Richard:
> Hi,
> 
> I'm wondering if anyone has used LVM in a high-availibility cluster
> where two servers are connected to shared storage (the physical
> volumes).  If so, which cluster solution did you use?  Will there be
> problems if the logical volumes are visable to both servers, even if
> only one of them has them mounted?  Thanks!

1) heartbeat (linux-ha; article found a while ago on samag.com)
2) not yet :-) but we are also doing offsite replication of the site,
   so it might be said that we can afford to take more risks than some.


-- 
    "The most valuable piece of equipment in the darkroom
     is the trash can."
                                  --Ansel Adams
