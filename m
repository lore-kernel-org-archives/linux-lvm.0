From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] read hangs when snapshot gets full
Message-ID: <20011213114814.GD942@tykepenguin.com>
References: <OF7400C79A.B656D5C3-ONC1256B21.003B305E@de.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF7400C79A.B656D5C3-ONC1256B21.003B305E@de.ibm.com>
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
Date: Thu Dec 13 05:46:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 13, 2001 at 12:02:41PM +0100, Martin Petermann wrote:
> Hi,
> 
> on my machine I installed kernel 2.4.16 and lvm 1.0.1. I've created a 400M
> filesystem and a 20M snapshot:
 
> Now I open the snapdevice for reading and copy a 10M file into the orig fs:

> Now the snapshot always gets inactivated:

Check dmesg to see why but I suspect it's just getting full. 10Meg is not very much
you know! You need to take into account the size of the COW table and things such as
the journal as well as the data that is copied.

patrick
