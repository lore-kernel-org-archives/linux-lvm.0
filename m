From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Need to remove broken hdd, and need to move the stuff i can from the broken disk
Message-ID: <20030727123229.GH14273@fib011235813.fsnet.co.uk>
References: <20030726194327.GF14273@fib011235813.fsnet.co.uk> <000001c3541f$2bed30b0$0296a8c0@malin>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c3541f$2bed30b0$0296a8c0@malin>
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
Date: Sun Jul 27 07:33:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Jul 27, 2003 at 11:12:10AM +0200, ^YosH^ wrote:
> Yes, pvmove tells me I don?t have enough free extents... isn?t there any
> command for like forcing to move as much as possible of the data to
> other disks... if not, its worth a feature request... is there any way
> to find out what data is on the disk I need to replace? 

I'm sure Alasdair could tell you a way to find out using the lvs
command.  I tend to just look at /etc/lvm/backup/<vg name>.  Send this
file to me (off list) if you have trouble interpreting it.  You'll
probably want to shrink the fs/volume that is on the bad pv before
doing the move.

- Joe
