Date: Wed, 26 Sep 2001 08:44:43 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] RAID1 on TOP of LVM
Message-ID: <20010926084443.A15158@colombina.comedia.it>
References: <3BB14C43.B62B32AB@bellatlantic.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3BB14C43.B62B32AB@bellatlantic.net>; from sarma@bellatlantic.net on Tue, Sep 25, 2001 at 11:32:19PM -0400
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

On Tue, Sep 25, 2001 at 11:32:19PM -0400, Uday Bhaskar Sarma Seetamraju wrote:
> I have had LVM for a little while now.
> I have even successfully extended an LV.  Moved PVs.
> And better yet.  Destroyed and recreated an LV containing Data :-)
> The final step, RAID1.  But I stumbled.
> Can someone help?
honestly i'd use lvm over raid1, it is most flexible since raid1 is not resizable.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
