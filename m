From: Tobias Wagener <tobias-lvm@tobias.wagener.nu>
Message-ID: <20031122160606.A1247@wagener.nu>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] reiserfs_resize and lvreduce
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
Date: Sat Nov 22 09:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I want to reduce a LV. My question is, will reiserfs_resize move used
blocks in the "reduce"-area on my LV to unused blocks? Or must I do this
for my own by hand? And if how? 

Greetings
