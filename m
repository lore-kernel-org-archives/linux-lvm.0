Message-ID: <3FC3637A.8070100@webhackande.se>
From: Rickard Olsson <richie@webhackande.se>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Lost partition table, how can I find the start of
 the PV?
References: <1069736195.28598.76.camel@pc>
In-Reply-To: <1069736195.28598.76.camel@pc>
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 25 08:14:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Brian J. Murrell wrote:

> I am hoping somebody can suggest a tool/operation to try to recover at
> least enough of a partition table to try to get /dev/hda3 (and hda1 and
> hda2 if possible.

You can try gpart: http://www.stud.uni-hannover.de/user/76201/gpart/

    / Rickard Olsson,IT-Konsult/
   / Telefon: +46 70 635 01 42/
  / http://www.webhackande.se/
