Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020228143217.GA4198@fib011235813.fsnet.co.uk>
References: <20020228113040.GA1898@fib011235813.fsnet.co.uk>
    <20020228130337.65981.qmail@web13001.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020228130337.65981.qmail@web13001.mail.yahoo.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Feb 28 08:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Feb 28, 2002 at 05:03:37AM -0800, Prashant Kharche wrote:
> 
>   Basically, we are putting a lock on the VG while it
> is getting resized or for any tool which tries to
> access VG .. So that no other user can access the
> metadata of that VG.. 
> WE ARE ONLY MATAINING THE CONSISTENCY OF THE VG
> METADATA.. 
> We thought of protecting VG DATA (NOT METADATA), but
> it becomes very completed.. so as if now we are not
> taking care of FS access..  

You need to take care that the volume groups running on all nodes
*always* reflect the metadata on disk.

For instance, if have two nodes running vg0/lvol0, and I issue a
pvmove from node1, when does node2 find out that the mapping has
changed ?

- Joe
