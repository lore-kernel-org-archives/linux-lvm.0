From: Andreas Dilger <adilger@turbolabs.com>
Date: Thu, 13 Sep 2001 21:06:15 -0600
Subject: Re: [linux-lvm] changing LE / PE table
Message-ID: <20010913210614.P1541@turbolinux.com>
References: <1157.213.191.82.129.1000424493.squirrel@hactar.dnsalias.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1157.213.191.82.129.1000424493.squirrel@hactar.dnsalias.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sep 14, 2001  01:41 +0200, Julian Glashoff wrote:
> I already tried that. But all I get is a file with 328 \0's...
> How can I find out where the metadata of my volume is?

The numbers used in my example depend on the values output from "pvdata -PP"
and also the LV number in question.  In the example, it was LV 0 that was
affected, so it was easy to work with.  Add 328 bytes offset to the start
of the LV table for each LV number increase.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
