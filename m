From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read is blocking if reading snapshots with 16k
    blocks on mp systems
Message-Id: <20020111154408.GF1274@tykepenguin.com>
References: <OFF21038E8.8E1F7C47-ONC1256B3D.006602E0@de.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFF21038E8.8E1F7C47-ONC1256B3D.006602E0@de.ibm.com>
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
Date: Fri Jan 11 09:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 10, 2002 at 07:58:37PM +0100, Martin Petermann wrote:
> Hi all,
> 
> I had some performance problems, than I wrote a small program to see where
> it was hanging:
> 
> -my configuration:
> 
> I'm using a SuSE 7.1 and SuSE 7.2 mp system (two processors).
> I've created a snapshot in the following way:

 
> The maximum time read was hanging was 40 seconds. I detected similar
> problems reading 3*4096 bytes.

Can you tell us more about your system - I can't get this to over 3 seconds even
on a dog slow IDE system with next-to no memory. 

patrick
