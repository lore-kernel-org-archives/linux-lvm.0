From: Andres Salomon <dilinger@mp3revolution.net>
Message-Id: <20020223214540.GA12317@mp3revolution.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] mapping blocks to PVs?
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
Date: Sat Feb 23 15:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've got a LV that keeps corrupting, made up of several IDE disks.  I've
already discovered one of the drives to be flaking out, after various
read tests on the device gave BadCRC/IRQ timeout errors.  Read tests on
the other drives succeeded; however, I'm still getting stuff like:

journal_bmap: journal block not found at offset 7180 on lvm(58,0)

and

/dev/site/lvol1: recovering journal
JFS: bad block at offset 7182

How can I figure out which PV is holding block 7180 and 7182?  

-- 
"I think a lot of the basis of the open source movement comes from
  procrastinating students..."
	-- Andrew Tridgell <http://www.linux-mag.com/2001-07/tridgell_04.html>
