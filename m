Subject: Re: Antwort: Re: [linux-lvm] MultiPath
From: Ryan Frank <Ryan.Frank@twcable.com>
In-Reply-To: <OF3FA18EC2.6DB9EC24-ONC1256D2F.00199A52@phoenixcontact.com>
References: <OF3FA18EC2.6DB9EC24-ONC1256D2F.00199A52@phoenixcontact.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1053696372.1216.92.camel@prvpcompq249.css.twable.com>
Mime-Version: 1.0
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
Date: Fri May 23 08:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM List <linux-lvm@sistina.com>

On Fri, 2003-05-23 at 00:41, Dietmar Stein wrote:
> Hi
> 
> Follow documentation / sample raidtab for multipathing, which comes with
> raidtools. If you've done that, both paths should be used (we have tested
> this once and it was working, also the failover of the active path).
> 
> Otherwise I would say there's a misconfiguration.
> 
> Dietmar

Thats where I am now, I followed the docs, and even tried a couple
things I found using google... However, it doesn't seem to like the
second path.  If I cat /proc/mdstat it shows two paths... But If I write
to the volume's I only see one path of activity... If I pull that line,
the write stops... Weird... I will keep working it..
 
-- 
+----------------------------------------------------+
|Ryan Frank               Unix System Administrator  |
|Time Warner Cable        7910 Crescent Executive Dr.|
|(704) 731-3324 - phone   3rd Floor                  |
|(704) 731-1180 - fax     Charlotte, NC 28217        |
|150*143328*1 - nextel    ryan.frank@twcable.com     |
+----------------------------------------------------+
