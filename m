Date: Thu, 15 Jun 2000 01:21:31 +0200
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] IBM to release LVM Technology to the Linux Community
Message-ID: <20000615012131.A28642@gruyere.muc.suse.de>
References: <852568FE.00750CE1.00@d54mta02.raleigh.ibm.com>
Mime-Version: 1.0
In-Reply-To: <852568FE.00750CE1.00@d54mta02.raleigh.ibm.com>; from benr@us.ibm.com on Wed, Jun 14, 2000 at 05:18:26PM -0400
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: benr@us.ibm.com
Cc: linux-lvm@msede.com, sbest@us.ibm.com, andrea@suse.de

On Wed, Jun 14, 2000 at 05:18:26PM -0400, benr@us.ibm.com wrote:
> The first of several white papers describing the LVMS architecture can be
> found at the IBM Linux Technology Center website:
> 
> http://oss.software.ibm.com/developerworks/opensource/linux/
> 
> Since we would like to have an honest, open discussion about this, I would
> suggest that all interested parties post their comments to the LVM mailing
> list (unless someone has a better suggestion!).  All comments are welcome!

The stacking of multiple block translation modules seems to be already 
implemented in 2.4-latest, although it is a bit of a hack and SMP 
unfriendly.

The white paper talks about software RAID. Do you plan to release an
own software RAID implementation or just a port of the existing MD  ?


-Andi
