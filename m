From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Get rid of files of a non existing volume group
Message-ID: <20020706082758.GC13154@tykepenguin.com>
References: <20020705205324.GA1287@glorybox.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020705205324.GA1287@glorybox.de>
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
Date: Sat Jul  6 03:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 05, 2002 at 10:53:24PM +0200, Kai Weber wrote:
> Hi,
> 
> I have lost a hard disk (died). I had a volume group on this disk. Now I
> have replaced the disk with a new one and wanted to create the old scheme
> on this disk:
> 
> $ vgcreate datavg /dev/hdb1
> vgcreate -- directory /dev/datavg already exists
> 
> As you can see the old /dev/datavg still exists on my root-partition. How
> do I get rid of the old files? There is no VG datavg anymore, but I want to
> have the name back.
> 
> Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?

You can safely delete the directory. When you re-created the VG and LVs then
nodes will be re-created.
 
> vgscan does not find the VG datavg anymore.

Well...er... if it's a totally new disk it won't. :)

patrick
