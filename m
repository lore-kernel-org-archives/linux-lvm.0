Date: Fri, 15 Jul 2005 19:13:49 +0200
From: maximilian attems <maks@sternwelten.at>
Message-ID: <20050715171349.GF17328@sputnik.stro.at>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] [patch] lvm document how to recover pv metadata
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: alewis@redhat.com
Cc: linux-lvm@redhat.com

thanks a lot to roadrunner on #lvm.
belows cmd recovered a partition of mine that i had nuked with mkswap.
not much sleep helps to do such nonesense.

added relevant pvcreate to the recipe section with a big fat warning.

--
maks

--- a/LVM-HOWTO.xml.old	2005-07-15 18:57:05.000000000 +0200
+++ b/LVM-HOWTO.xml	2005-07-15 19:02:52.000000000 +0200
@@ -4372,6 +4372,36 @@ default=lvm
         </para>
       </sect2>
     </sect1>
+    <sect1 id="recovermetadata"><title>Recover physical volume metadata</title>
+      <title>Restore physical volume:</title>
+      <para>
+        If you get the warning "incorrect metadata area header checksum"
+	you probably toasted the volume group descriptor area and lvm
+	startup can't occur. 
+      </para>
+    <warning><title>Warning</title>
+      <para>
+        Don't do this on a properly working lvm.
+        First you need to specify the correct physical volume to 
+	<command>pvcreate</command> or you may lose your data.
+      </para>
+    </warning>
+      <para>
+	Then you need to extract the exact uuid for the relevant partition 
+	(PhysicalVolume of course) from the file 
+	<filename>/etc/lvm/archive/VolumeGroupName_XXXXX.vg</filename>.
+	(Where XXXXX represents the number of the last known good archived lvm
+	metadata). <command>pvcreate</command> can restore the metadata:
+	<command>pvcreate --uuid ".." --restorefile /etc/lvm/archive/VolumeGroupName_XXXXX.vg PhysicalVolume</command>
+      </para>
+      <para>
+	If you are lucky you'll find that the lvm metadata takes on disk 
+	at least so much space than a swap signature. So aboves command
+	can recover a physical volume from an accidental mkswap.
+	<command>pvcreate</command> only overwrites the lvm metadata areas
+	on disk and doesn't touch the data areas (the logical volumes).
+      </para>
+    </sect1>
   </chapter>
 
   <appendix id="dangerousops"><title>Dangerous Operations</title>
