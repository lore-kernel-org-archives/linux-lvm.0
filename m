From: Scott Mcdermott <smcdermott@questra.com>
Subject: Re: [linux-lvm] Multiple Path possible with LVM ?
Message-ID: <20030708211242.GD8053@questra.com>
References: <1057697033.3f0b2d095b2ac@babayaga.bgc-jena.mpg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1057697033.3f0b2d095b2ac@babayaga.bgc-jena.mpg.de>
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
Date: Tue Jul  8 16:13:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dr.Peer-Joachim Koch on Tue  8/07 22:43 +0200:
> is it possible to use to different alternated physical 
> pathes with the linux LVM ?

Just put your lvm volume on an md multipath device.  Note
that these are not loadbalanced paths in stock kernels, just
failover paths.
