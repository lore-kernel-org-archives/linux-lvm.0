From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Help - how do I recover a lost Volume Group
Message-ID: <20030415094210.GB1250@tykepenguin.com>
References: <925726E04C33D511B1D20002B3289E8E02F751D5@bardeen.logica.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <925726E04C33D511B1D20002B3289E8E02F751D5@bardeen.logica.co.uk>
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
Date: Tue Apr 15 04:42:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Apr 15, 2003 at 09:28:46AM +0100, Chandler, Alan wrote:
> I am not subscribed to this list - please CC me back again and to the copy
> address (home and work).
> 
> It was starting to fail so I have purchased another disk and temporarily
> wired it in as /dev/hdb.  I created three partitions on in with /dev/hdb3 as
> the lvm partition.  I successfully copied the first two partitions but with
> the third, in order to preserve my volume group name (vg1), I did pvcreate
> /dev/hdb3, vgextend vg1 /dev/hdb3 and pvmove /dev/hda3 so that all the data
> should now be on /dev/hdb3.

Did you vgreduce the old disk out of the VG ?

If not, then the easiest thing to do is attach the old disk, vgreduce it out of
the VG and all should be well.

-- 

patrick
