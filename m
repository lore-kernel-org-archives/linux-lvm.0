From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Dangerous Recipes
Message-ID: <20030128081507.GA31789@tykepenguin.com>
References: <022501c2c644$92634410$4b66699f@win.doc.state.vt.us>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <022501c2c644$92634410$4b66699f@win.doc.state.vt.us>
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
Date: Tue Jan 28 02:17:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 27, 2003 at 03:42:13PM -0500, Joseph Kezar wrote:
> I have a single shared SCSI JBOD.  And it makes up my VolumeGroupMailData.
> 
> It is mounted read/write by only 1 node at any given time.  This is strictly
> enforced.
> 
> Although, at boot both nodes vgchange -a y the Volume Group.
> So it is picked up in vgscan as an active VG on node1 and node2
> I am aware if I need to make a change, like adding a Logical Volume,
> Extending/Reducing a Logical Volume, or adding/subtracting a physical volume
> that the volume must be deactivated on the secondary node(in my case node
> 2).
> 
> If everything goes well enforced, am I still in trouble or at risk of data
> corruption?

If you are careful it should be fine. 

What you must always remember to do is "vgchange -an" on the secondary node
before doing the metadata changes, then a "vgscan;vgchange -ay" on that node
after the metadata changes.

-- 

patrick
