From: "Kai-Min Sung" <k@kaisung.com>
Subject: RE: [linux-lvm] lvm in linux SAN enviroment ?
Message-ID: <002801c32697$75642380$3200a8c0@nimiak>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200305301109.44884.krienke@uni-koblenz.de>
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
Date: Fri May 30 05:36:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

>Can anyone please comment on this scenario? 

I'm not sure I fully understand your configuration, however...

>If this setup is simply "wrong", how could I tell vgscan which might to
my 
>knowledge be the problem, that it should not scan all physical devices
it 
>finds to avoid trouble.

...I know that with LVM2, you can define a filter (using regular
expressions) in the lvm.conf file, which will restrict the devices in
/dev that vgscan scans. There are several example filters in the
docs/example.conf file included in the tarball.

Regards,
-Kai 
