From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Instability with 2.6, recovering (meta)data?
Message-ID: <20031110185503.I16901@uk.sistina.com>
References: <20031109213821.GA4425@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031109213821.GA4425@amphibian.dyndns.org>; from toad@amphibian.dyndns.org on Sun, Nov 09, 2003 at 09:38:21PM +0000
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
Date: Mon Nov 10 12:56:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 09, 2003 at 09:38:21PM +0000, Toad wrote:
> after some operation or other (creating an LV? resizing one?) on
> LVM on 2.6, I could no longer access my LVs under 2.4/LVM1.

Likely to have been creating an LV.

The LVM2 CVS head contains a workaround for this; I'll release a new
LVM2 tarball shortly.
 
Alasdair
-- 
agk@uk.sistina.com
