From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Instability with 2.6, recovering (meta)data?
Message-ID: <20031110190730.J16901@uk.sistina.com>
References: <20031109213821.GA4425@amphibian.dyndns.org> <20031110174615.GE20777@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031110174615.GE20777@amphibian.dyndns.org>; from toad@amphibian.dyndns.org on Mon, Nov 10, 2003 at 05:46:15PM +0000
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
Date: Mon Nov 10 13:09:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Toad <toad@amphibian.dyndns.org>
Cc: linux-lvm@sistina.com

On Mon, Nov 10, 2003 at 05:46:15PM +0000, Toad wrote:
> With agk's help, I eventually found that this worked:
> vgcfgrestore vg-big -M1 -f /etc/lvm/archive/vg-big_00003.vg

LVM2 tools default to using a new improved metadata format.
To tell some tools to use the old LVM1 format of metadata, you need -M1.
(Most tools work it out for themselves, but some, like vgcreate
& vgcfgrestore still need to be told).

You can change the default choice for all tools back to the LVM1 format 
in the config file with:
  global { format = "lvm1" }
 
Alasdair
-- 
agk@uk.sistina.com
