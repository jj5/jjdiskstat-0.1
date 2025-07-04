drop table if exists t_backblaze;

create table t_backblaze(
  date  varchar(255) null,
  serial_number  varchar(255) null,
  model  varchar(255) null,
  capacity_bytes  varchar(255) null,
  failure  varchar(255) null,
  datacenter  varchar(255) null,
  cluster_id  varchar(255) null,
  vault_id  varchar(255) null,
  pod_id  varchar(255) null,
  pod_slot_num  varchar(255) null,
  is_legacy_format  varchar(255) null,
  smart_1_normalized text null,
  smart_1_raw text null,
  smart_2_normalized text null,
  smart_2_raw text null,
  smart_3_normalized text null,
  smart_3_raw text null,
  smart_4_normalized text null,
  smart_4_raw text null,
  smart_5_normalized text null,
  smart_5_raw text null,
  smart_7_normalized text null,
  smart_7_raw text null,
  smart_8_normalized text null,
  smart_8_raw text null,
  smart_9_normalized text null,
  smart_9_raw text null,
  smart_10_normalized text null,
  smart_10_raw text null,
  smart_11_normalized text null,
  smart_11_raw text null,
  smart_12_normalized text null,
  smart_12_raw text null,
  smart_13_normalized text null,
  smart_13_raw text null,
  smart_15_normalized text null,
  smart_15_raw text null,
  smart_16_normalized text null,
  smart_16_raw text null,
  smart_17_normalized text null,
  smart_17_raw text null,
  smart_18_normalized text null,
  smart_18_raw text null,
  smart_22_normalized text null,
  smart_22_raw text null,
  smart_23_normalized text null,
  smart_23_raw text null,
  smart_24_normalized text null,
  smart_24_raw text null,
  smart_27_normalized text null,
  smart_27_raw text null,
  smart_71_normalized text null,
  smart_71_raw text null,
  smart_82_normalized text null,
  smart_82_raw text null,
  smart_90_normalized text null,
  smart_90_raw text null,
  smart_160_normalized text null,
  smart_160_raw text null,
  smart_161_normalized text null,
  smart_161_raw text null,
  smart_163_normalized text null,
  smart_163_raw text null,
  smart_164_normalized text null,
  smart_164_raw text null,
  smart_165_normalized text null,
  smart_165_raw text null,
  smart_166_normalized text null,
  smart_166_raw text null,
  smart_167_normalized text null,
  smart_167_raw text null,
  smart_168_normalized text null,
  smart_168_raw text null,
  smart_169_normalized text null,
  smart_169_raw text null,
  smart_170_normalized text null,
  smart_170_raw text null,
  smart_171_normalized text null,
  smart_171_raw text null,
  smart_172_normalized text null,
  smart_172_raw text null,
  smart_173_normalized text null,
  smart_173_raw text null,
  smart_174_normalized text null,
  smart_174_raw text null,
  smart_175_normalized text null,
  smart_175_raw text null,
  smart_176_normalized text null,
  smart_176_raw text null,
  smart_177_normalized text null,
  smart_177_raw text null,
  smart_178_normalized text null,
  smart_178_raw text null,
  smart_179_normalized text null,
  smart_179_raw text null,
  smart_180_normalized text null,
  smart_180_raw text null,
  smart_181_normalized text null,
  smart_181_raw text null,
  smart_182_normalized text null,
  smart_182_raw text null,
  smart_183_normalized text null,
  smart_183_raw text null,
  smart_184_normalized text null,
  smart_184_raw text null,
  smart_187_normalized text null,
  smart_187_raw text null,
  smart_188_normalized text null,
  smart_188_raw text null,
  smart_189_normalized text null,
  smart_189_raw text null,
  smart_190_normalized text null,
  smart_190_raw text null,
  smart_191_normalized text null,
  smart_191_raw text null,
  smart_192_normalized text null,
  smart_192_raw text null,
  smart_193_normalized text null,
  smart_193_raw text null,
  smart_194_normalized text null,
  smart_194_raw text null,
  smart_195_normalized text null,
  smart_195_raw text null,
  smart_196_normalized text null,
  smart_196_raw text null,
  smart_197_normalized text null,
  smart_197_raw text null,
  smart_198_normalized text null,
  smart_198_raw text null,
  smart_199_normalized text null,
  smart_199_raw text null,
  smart_200_normalized text null,
  smart_200_raw text null,
  smart_201_normalized text null,
  smart_201_raw text null,
  smart_202_normalized text null,
  smart_202_raw text null,
  smart_206_normalized text null,
  smart_206_raw text null,
  smart_210_normalized text null,
  smart_210_raw text null,
  smart_211_normalized text null,
  smart_211_raw text null,
  smart_212_normalized text null,
  smart_212_raw text null,
  smart_218_normalized text null,
  smart_218_raw text null,
  smart_220_normalized text null,
  smart_220_raw text null,
  smart_222_normalized text null,
  smart_222_raw text null,
  smart_223_normalized text null,
  smart_223_raw text null,
  smart_224_normalized text null,
  smart_224_raw text null,
  smart_225_normalized text null,
  smart_225_raw text null,
  smart_226_normalized text null,
  smart_226_raw text null,
  smart_230_normalized text null,
  smart_230_raw text null,
  smart_231_normalized text null,
  smart_231_raw text null,
  smart_232_normalized text null,
  smart_232_raw text null,
  smart_233_normalized text null,
  smart_233_raw text null,
  smart_234_normalized text null,
  smart_234_raw text null,
  smart_235_normalized text null,
  smart_235_raw text null,
  smart_240_normalized text null,
  smart_240_raw text null,
  smart_241_normalized text null,
  smart_241_raw text null,
  smart_242_normalized text null,
  smart_242_raw text null,
  smart_244_normalized text null,
  smart_244_raw text null,
  smart_245_normalized text null,
  smart_245_raw text null,
  smart_246_normalized text null,
  smart_246_raw text null,
  smart_247_normalized text null,
  smart_247_raw text null,
  smart_248_normalized text null,
  smart_248_raw text null,
  smart_250_normalized text null,
  smart_250_raw text null,
  smart_251_normalized text null,
  smart_251_raw text null,
  smart_252_normalized text null,
  smart_252_raw text null,
  smart_254_normalized text null,
  smart_254_raw text null,
  smart_100_normalized text null,
  smart_100_raw text null
)
DEFAULT CHARACTER SET ascii
COLLATE ascii_general_ci;
